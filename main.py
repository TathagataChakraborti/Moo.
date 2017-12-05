from flask import Flask, request, send_from_directory, render_template
from interface import plan, explain

app = Flask(__name__, static_url_path='')

@app.route('/')
@app.route('/student')
def root():
	return render_template('student_interface.html')

@app.route('/teacher')
def teacher():
	return render_template('instructor_interface.html')

@app.route('/js/<path:path>')
def send_js(path):
	return send_from_directory('static/js', path)

@app.route('/css/<path:path>')
def send_css(path):
	return send_from_directory('static/css', path)

@app.route('/images/<path:path>')
def send_images(path):
	return send_from_directory('static/images', path)

@app.route('/plan', methods = ['GET', 'POST'])
def create_plan():
	difficulty = request.args.get('d', 1, type=int)
	withStudent = request.args.get('s', True, type=bool)

	#sol = plan("")
	if len(sol) > 0:
		return ''.join(sol)
	else:
		return 'No Plan Found'

#if __name__ = "__main__":
#	app.run()
