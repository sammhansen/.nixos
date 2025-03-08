import { bind } from "astal";
import { execAsync } from "astal/process";
import { Variable } from "astal";
import { CircularProgress } from "astal/gtk3/widget";
import { MaterialIcon } from "../../custom/MaterialIcon";

// Helper function to execute shell commands and update values
const createUsageVariable = (command: string, interval = 2000) => {
	const variable = Variable(0);

	const updateUsage = async () => {
		try {
			const output = await execAsync(["bash", "-c", command]);
			variable.set(parseFloat(output.trim()) || 0);
		} catch (err) {
			console.error(`Error fetching ${command}:`, err);
		}
	};

	updateUsage();
	setInterval(updateUsage, interval);

	return variable;
};

// Create variables for CPU, RAM, Swap, and Storage usage
const cpuUsage = createUsageVariable(`top -bn1 | grep Cpu | awk '{print $2}'`);
const ramUsage = createUsageVariable(`free | awk '/^Mem/ {printf("%.2f", ($3/$2) * 100)}'`);
const swapUsage = createUsageVariable(`free | awk '/^Swap/ {if ($2 > 0) printf("%.2f", ($3/$2) * 100); else print "0";}'`);
const storageUsage = createUsageVariable(`df / | awk 'NR==2 {print $5}' | sed 's/%//'`);

export function Sys() {
	const cpu = bind(cpuUsage);
	const ram = bind(ramUsage);
	const swap = bind(swapUsage);
	const storage = bind(storageUsage);

	const size = 15;

	return (
		<box
			vertical={true}
			vexpand={true}
		>
			<CircularProgress
				className="CircleIndicator"
				value={cpu.as(v => v / 100)}
				startAt={0.75}
				endAt={0.75}
				rounded
				marginBottom={7}
				child={<MaterialIcon icon="memory" size={size} />}
			/>
			<CircularProgress
				className="CircleIndicator"
				value={ram.as(v => v / 100)}
				startAt={0.75}
				endAt={0.75}
				rounded
				marginBottom={7}
				child={<MaterialIcon icon="memory_alt" size={size} />}
			/>
			<CircularProgress
				className="CircleIndicator"
				value={swap.as(v => v / 100)}
				startAt={0.75}
				endAt={0.75}
				rounded
				marginBottom={7}
				child={<MaterialIcon icon="swap_horiz" size={size} />}
			/>
			<CircularProgress
				className="CircleIndicator"
				value={storage.as(v => v / 100)}
				startAt={0.75}
				endAt={0.75}
				rounded
				child={<MaterialIcon icon="sd_card" size={size} />}
			/>

		</box>
	);
}

