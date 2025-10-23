run_app:
	python3 test_dash_app_hosting/app.py & sleep 90

	wget -r http://127.0.0.1:8050/
	wget -r http://127.0.0.1:8050/_dash-layout 
	wget -r http://127.0.0.1:8050/_dash-dependencies

	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dcc/async-graph.js
	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dcc/async-highlight.js
	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dcc/async-markdown.js
	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dcc/async-datepicker.js

	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dash_table/async-table.js
	wget -r http://127.0.0.1:8050/_dash-component-suites/dash/dash_table/async-highlight.js

# 	wget -r http://127.0.0.1:8050/_dash-component-suites/plotly/package_data/plotly.min.js
	mv 127.0.0.1:8050 app_files
	ls -a app_files

# 	find app_files -exec gsed -i.bak 's|_dash-component-suites|app_files/_dash-component-suites|g' {} \;
# 	find app_files -exec gsed -i.bak 's|_dash-layout|app_files/_dash-layout.json|g' {} \;
# 	find app_files -exec gsed -i.bak 's|_dash-dependencies|app_files/_dash-dependencies.json|g' {} \;
# 	find app_files -exec gsed -i.bak 's|_reload-hash|app_files/_reload-hash|g' {} \;
# 	find app_files -exec gsed -i.bak 's|_dash-update-component|app_files/_dash-update-component|g' {} \;

	mv app_files/_dash-layout app_files/_dash-layout.json
	mv app_files/_dash-dependencies app_files/_dash-dependencies.json

	pkill -9 python

clean_dirs:
	ls
	rm -rf 127.0.0.1:8050/
	rm -rf app_files/
	rm -rf joblib