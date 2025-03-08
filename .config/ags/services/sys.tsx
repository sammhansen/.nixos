import GTop from "gi://GTop";
import { GLib, Variable } from "astal";
import type { Subscribable } from "astal/binding";

// Create reactive variables for system stats
const cpuUsage = Variable(0);
const ramUsage = Variable(0);
const swapUsage = Variable(0);
const storageUsage = Variable(0);

let previousCpuData = new GTop.glibtop_cpu();
GTop.glibtop_get_cpu(previousCpuData);

function computeCPU(): number {
	const currentCpuData = new GTop.glibtop_cpu();
	GTop.glibtop_get_cpu(currentCpuData);

	const totalDiff = currentCpuData.total - previousCpuData.total;
	const idleDiff = currentCpuData.idle - previousCpuData.idle;

	previousCpuData = currentCpuData;

	return totalDiff > 0 ? ((totalDiff - idleDiff) / totalDiff) * 100 : 0;
}

function computeRAM(): number {
	const memData = new GTop.glibtop_mem();
	GTop.glibtop_get_mem(memData);

	return (memData.used / memData.total) * 100;
}

function computeSwap(): number {
	const swapData = new GTop.glibtop_swap();
	GTop.glibtop_get_swap(swapData);

	return swapData.total > 0 ? (swapData.used / swapData.total) * 100 : 0;
}

function computeStorage(): number {
	const fsData = new GTop.glibtop_fsusage(); // ✅ Proper struct initialization
	GTop.glibtop_get_fsusage("/", fsData); // ✅ Correct struct usage

	const totalStorage = fsData.blocks * fsData.block_size;
	const usedStorage = (fsData.blocks - fsData.bavail) * fsData.block_size;

	return totalStorage > 0 ? (usedStorage / totalStorage) * 100 : 0;
}

function setupPolling() {
	GLib.timeout_add(GLib.PRIORITY_DEFAULT, 2000, () => {
		cpuUsage.set(computeCPU());
		ramUsage.set(computeRAM());
		swapUsage.set(computeSwap());
		storageUsage.set(computeStorage());
		return true; // Keep polling
	});
}

setupPolling();

export function getCPUUsage(): Subscribable<number> {
	return cpuUsage;
}

export function getRAMUsage(): Subscribable<number> {
	return ramUsage;
}

export function getSwapUsage(): Subscribable<number> {
	return swapUsage;
}

export function getStorageUsage(): Subscribable<number> {
	return storageUsage;
}

