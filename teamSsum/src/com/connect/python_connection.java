package com.connect;

import java.io.*;
import java.util.*;

public class python_connection {
	public void weather_py() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\darkl\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\darkl\\git\\ssum\\teamproject\\teamSsum\\WebContent\\py\\weather_list.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
	public void movie_py() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\darkl\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\darkl\\git\\ssum\\teamproject\\teamSsum\\WebContent\\py\\movie_crawling.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
	public void show_py() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\darkl\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\darkl\\git\\ssum\\teamproject\\teamSsum\\WebContent\\py\\show_crawling.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
}