import os
import copy

import cson


original_config = os.path.expanduser('~/.atom/config.cson')
local_config = './config.cson'
tmp_config = './config.json'
local_conf = cson.load(open(local_config, 'r'))
try:
    atom_conf = cson.load(open(original_config, 'r'))
except:
    print('Original config NOT found, create a new one')
    atom_conf = local_conf



def deepupdate(target, src):
    for k, v in src.items():
        if type(v) == list:
            if not k in target:
                target[k] = copy.deepcopy(v)
            else:
                target[k].extend(v)
        elif type(v) == dict:
            if not k in target:
                target[k] = copy.deepcopy(v)
            else:
                deepupdate(target[k], v)
        elif type(v) == set:
            if not k in target:
                target[k] = v.copy()
            else:
                target[k].update(v.copy())
        else:
            target[k] = copy.copy(v)


deepupdate(atom_conf, local_conf)

cson.dump(atom_conf, open(tmp_config, 'w'))

cmd = 'json2cson --2spaces %s > %s' % (tmp_config, original_config)
os.system(cmd)
os.system('rm %s' % tmp_config)
