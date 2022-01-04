import argparse
import json
import yaml

def run(data,yaml_file):
    with open(yaml_file, 'rb') as f:
        queries = yaml.load(f, Loader=yaml.FullLoader)
    return json.dumps(queries[data])

def get_keys(yaml_file):
    with open(yaml_file, 'rb') as f:
        queries = yaml.load(f, Loader=yaml.FullLoader)
    return queries["id_key"]["id"], queries["id_key"]["key"]

def parse_out():
    parser = argparse.ArgumentParser()
    parser.add_argument('--data', type = str,  default = '', help = 'data 값')
    parser.add_argument('--yaml-file', type = str, default = '', help = 'yaml 값')
    args = parser.parse_args()
    return args

def main(aa):
    run(**vars(aa))
    
if __name__ == "__main__":
    aa = parse_out()
    main(aa)