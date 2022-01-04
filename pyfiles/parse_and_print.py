import json
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--j', type=str)

args = parser.parse_args()

with open(args.j, "rb") as f:
    d = json.load(f)
    
print(json.dumps(d, indent=2))