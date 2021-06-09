# -*- mode: python ; coding: utf-8 -*-


import gooey
gooey_root = os.path.dirname(gooey.__file__)
gooey_languages = Tree(os.path.join(gooey_root, 'languages'), prefix = 'gooey/languages')
gooey_images = Tree(os.path.join(gooey_root, 'images'), prefix = 'gooey/images')

block_cipher = None


a = Analysis(['ecl.py'],
             pathex=['/Users/gvanriessen/code/GitHub/potentiostat/software/python/potentiostat'],
             binaries=[],
             datas=[],
             hiddenimports=[],
             hookspath=['./hooks'],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)



options = [('u', None, 'OPTION')]


exe = EXE(pyz,
          a.scripts,
          [],
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          options,
          gooey_languages, # Add them in to collected files
          gooey_images, # Same here.
          name='ecl',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=True,
          console=False,
        icon=os.path.join(gooey_root, 'images', 'program_icon.ico'))
