from quart import Quart, render_template

app = Quart(__name__)

@app.route("/")
async def hello():
  return await render_template("index.html")

@app.route("/register_service")
async def register_service():
  return {
    "name": "Fuzzy Data Map Viewer",
    "description": "A visualisation suited to live decision making with noisy gps related data",
    "icon": "map-marker-distance",
    "company": "ALT Scientific",
    "version": "0.0.1",
    "new_page": False,
    "webpage": "https://github.com/altmattr/fuzzy-data-viewer",
    "api": "https://github.com/altmattr/fuzzy-data-viewer/wiki/api"
  }
