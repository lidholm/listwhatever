
with open('.prod.env', 'r') as file:
    variablesData = file.readlines()

variables = {}

for i in variablesData:
    if i.strip() == "":
        continue
    variables[i.split('=')[0]] = i.split('=')[1][1:-2]

with open('./scripts/replace_env_vars.config', 'r') as file:
    configs = file.readlines()

for config in configs:
    filename = config.split('|')[0]
    variable = config.split('|')[1]

    with open(filename, 'r') as file:
        filedata = file.read()

    # Replace the target string
    filedata = filedata.replace('$' + variable,
                                variables[variable])

    # Write the file out again
    with open(filename, 'w') as file:
        file.write(filedata)
