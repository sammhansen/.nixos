{username, ...}: {
  environment.variables = {
    ILLOGICAL_IMPULSE_VIRTUAL_ENV = "/home/${username}/.local/state/ags/venv";
  };
}
