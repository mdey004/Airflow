from soda.scan import Scan  # Adjust this path based on the installed version

def check(scan_name, checks_subpath=None, data_source='credit', project_root='include'):
    print('Running Soda Scan ...')

    config_file = f'{project_root}/soda/configuration.yml'
    checks_path = f'{project_root}/soda/checks'

    if checks_subpath:
        checks_path += f'/{checks_subpath}'

    # Set up Soda Scan
    scan = Scan()
    scan.set_verbose()
    scan.add_configuration_yaml_file(config_file)
    scan.set_data_source_name(data_source)
    scan.add_sodacl_yaml_files(checks_path)
    scan.set_scan_definition_name(scan_name)

    # Execute the scan
    result = scan.execute()
    print(scan.get_logs_text())

    return result

    result = scan.execute()
    print(scan.get_logs_text())

    if result != 0:
        raise ValueError('Soda Scan failed')

    return result