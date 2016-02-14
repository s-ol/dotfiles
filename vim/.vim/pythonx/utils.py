def calculate_spacing(string, width=80, char=' '):
	if width < 1:
		width = 80 + width
	return (width - len(string)) * char

def run_figlet(string, font='future'):
	from subprocess import check_output
	return check_output(['toilet', '-f', font, string]).decode().strip()
