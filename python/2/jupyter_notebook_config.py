c.NotebookApp.terminals_enabled = True
c.NotebookApp.terminado_settings = {"shell_command": ["/bin/bash"]}

c.SystemdSpawner.environment_variables = ["SHELL=/bin/bash"]
c.SystemdSpawner.environment = {"SHELL": ["/bin/bash"]}
