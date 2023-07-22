
with open('.prod.env', 'r') as file:
    variablesData = file.readlines()

variables = {}

for i in variablesData:
    if i.strip() == "" or i.strip()[0] == "#":
        continue
    variables[i.split('=')[0]] = i.split('=')[1][1:-2]
print('len(variables): ' + str(len(variables)))
print('variables.keys(): ' + str(variables.keys()))

with open('./scripts/replace_env_vars.config', 'r') as file:
    configs = file.readlines()
print(configs)

count = 0
for config in configs:
    filename = config.split('|')[0]
    if filename.strip()[0] == "#":
        continue
    variable = config.split('|')[1]

    with open(filename, 'r') as file:
        filedata = file.read()

    # Replace the target string
    newFiledata = filedata.replace('<' + variable + '>',
                                variables[variable])
    if newFiledata != filedata:
        count += 1
    # Write the file out again
    with open(filename, 'w') as file:
        file.write(newFiledata)

print(f'Replaced {count} variables')
