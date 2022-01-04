import os
import json
import argparse
import yaml
import get_query

def run(yaml_file):
    db_path, key_path = get_query.get_keys(yaml_file)
    
    with open(db_path, "r") as f:
        db = f.read()
    with open(key_path, "r") as f:
        key = f.read()
    
    db = db.strip()
    key = key.strip()
    
    d = get_query.run("d", yaml_file)
    q = get_query.run("q", yaml_file)
    
    db = f'https://api.notion.com/v1/databases/{db}/query'
    tk = f'Authorization: Bearer {key}'
    nv = 'Notion-Version: 2021-08-16'
    ct = 'Content-Type: application/json'
    
    stream = os.popen(f'curl -X POST \'{db}\' -H \'{tk}\' -H \'{nv}\' -H \'{ct}\' --data \'{d}\'')
    output = stream.read()
    
    
    print(output)
    results = json.loads(output)
    print(json.dumps(results, indent=2))
        
    for result in results["results"]:
        strm = os.popen(f'curl \'https://api.notion.com/v1/pages/{result["id"]}\' -H \'{tk}\' -H \'{nv}\' -H \'{ct}\' -X PATCH --data \'{q}\'')
        out = strm.read()
        r = json.loads(out)
        # print(json.dumps(r, indent=2))

def parse_out():
    parser = argparse.ArgumentParser()
    parser.add_argument('--yaml-file', type = str, default = '', help = 'yaml 값')
    args = parser.parse_args()
    return args

def main(args):
    run(**vars(args))

if __name__ == "__main__":
    args = parse_out()
    main(args)