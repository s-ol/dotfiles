from themer import ThemeActivator
import i3ipc

class I3Focuser(ThemeActivator):
    def activate(self):
        conn = i3ipc.Connection()
        windows = conn.get_tree().leaves()
        windows.reverse()
        outputs = conn.get_outputs() # before we mess up the order

        for win in windows:
            conn.command("[con_id={}] focus".format(win.id))

        for out in outputs:
            if out['active'] and out['current_workspace']:
                conn.command("workspace {}".format( out['current_workspace'] ))
