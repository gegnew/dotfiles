# List available updates from the Arch User Repository (AUR)

# Copyright 2018 Johannes Lange
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import os
import requests
import subprocess as sp

block_button = os.environ['BLOCK_BUTTON'] if 'BLOCK_BUTTON' in os.environ else None
block_button = int(block_button) if block_button else None


class Args(object):
    def add_argument(self, name, default='', arg_type=str):
        val = default
        if name in os.environ:
            val = os.environ[name]
            if arg_type == list:
                val = val.split()
        val = arg_type(val)
        setattr(self, name.lower(), val)
        return val


args = Args()
args.add_argument('UPDATE_COLOR', 'yellow')
args.add_argument('QUIET', False, bool)
args.add_argument('IGNORE', [], list)


def version_in_aur(pkg):
    p = {'v': '5', 'type': 'search', 'by': 'name', 'arg': pkg}
    response = requests.get('https://aur.archlinux.org/rpc/', params=p)
    response = response.json()
    for r in response['results']:
        if r['Name'] == pkg:
            return r['Version']

    return "NotFound"


def vcs_version(pkg, ver):
    """ Try to find a sensble version for VSC packages
    If pkg looks like a VCS package according to
       https://wiki.archlinux.org/index.php/VCS_package_guidelines
    try to extract a sensible (= comparable) version number.
    """

    suffices = ['-cvs', '-svn', '-hg', '-darcs', '-bzr', '-git']
    if not any(pkg.endswith(suffix) for suffix in suffices):
        # does not look like a VCS package
        return ver

    if '.r' in ver:
        # of the form RELEASE.rREVISION: only use the release
        return ver.split('.r')[0]
    # no base release to compare, just return None
    return None


# get list of foreign packages -- assumed to be from the AUR
packages = sp.check_output(['pacman', '-Qm']).decode('utf8')

installed_version = {}
for pkg in packages.split('\n'):
    if not pkg:
        continue
    pkg, ver = pkg.split()
    installed_version[pkg] = ver

updates = []
for pkg in installed_version.keys():
    if pkg in args.ignore:
        continue
    v_aur = version_in_aur(pkg)
    v_inst = installed_version[pkg]
    if vcs_version(pkg, v_aur) != vcs_version(pkg, v_inst):
        updates.append(pkg + ' (%s -> %s)' % (v_inst, v_aur))

n_updates = len(updates)
if n_updates > 0:
    msg = "<span color='{0}'>{1} AUR updates</span>"
    print(msg.format(args.update_color, n_updates))
elif not args.quiet:
    print('AUR up to date')

if block_button in [2, 3]:
    sp.call(['notify-send', 'AUR updates', '\n'.join(updates)])

if not 'BLOCK_NAME' in os.environ and n_updates > 0:
    # not called by i3blocks: show the complete list
    p
