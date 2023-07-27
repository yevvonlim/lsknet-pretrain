import torch 
import argparse 



def parse_args():
    """Parse parameters."""
    parser = argparse.ArgumentParser(
        description='Extract Backbone weights for AIFactory submission')
    parser.add_argument('--path', help='weight file')
    
    args = parser.parse_args()
    return args


if __name__ == "__main__":
    args = parse_args()
    out = torch.load(args.path)
    result = {}
    result['state_dict'] = out['state_dict']
    torch.save(result, "lsknet_s_custom.pth")

