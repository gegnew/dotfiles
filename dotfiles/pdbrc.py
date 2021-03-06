import pdb

class Config(pdb.DefaultConfig):
    sticky_by_default = True # start in sticky mode
    current_line_color = 40  # black
    prefer_ipython = True

    def __init__(self):
        # readline.parse_and_bind('set convert-meta on')
        # readline.parse_and_bind('Meta-/: complete')

        try:
            from pygments.formatters import terminal
        except ImportError:
            pass
        else:
            self.colorscheme = terminal.TERMINAL_COLORS.copy()
            self.colorscheme.update({
                terminal.Keyword:            ('darkred',     'red'),
                terminal.Number:             ('darkyellow',  'yellow'),
                terminal.String:             ('brown',       'green'),
                terminal.Name.Function:      ('darkgreen',   'blue'),
                terminal.Name.Namespace:     ('teal',        'turquoise'),
                })

    # def setup(self, pdb):
    #     # this is mostly here as a template
    #     # make 'l' an alias to 'longlist'
    #     Pdb = pdb.__class__
    #     Pdb.do_l = Pdb.do_longlist
    #     Pdb.do_st = Pdb.
