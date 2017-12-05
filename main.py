from flask import Flask, request, send_from_directory, render_template
from interface import plan, explain

app = Flask(__name__, static_url_path='')

@app.route('/')
def root():
	return render_template('index.html')

@app.route('/js/<path:path>')
def send_js(path):
	return send_from_directory('js', path)

@app.route('/css/<path:path>')
def send_css(path):
	return send_from_directory('css', path)

@app.route('/plan', methods = ['GET', 'POST'])
def create_plan():
	sol = plan("")
	if len(sol) > 0:
		return '<pre>\n'+''.join(sol)+'</pre>'
	else:
		return 'No Plan Found'

#if __name__ = "__main__":
#	app.run()