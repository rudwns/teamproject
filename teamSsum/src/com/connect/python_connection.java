package com.connect;

import java.io.*;
import java.util.*;

public class python_connection {
	public void weather_py() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\weather_list.py");

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
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\movie_crawling.py");

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
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\show_crawling.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
	public void map_py() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\map_crawling.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
	public void gift_py1() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\gift_crawling.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
	public void gift_py2() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\gift_crawling2.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
	public void gift_py3() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\gift_crawling3.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
	public void gift_py4() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\gift_crawling4.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
	public void gift_py5() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\gift_crawling5.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
	public void kakao_analysis() throws IOException {

		try {
			Runtime r = Runtime.getRuntime();
			Process p = r.exec(
					"cmd /c C:\\Users\\pc-06\\AppData\\Local\\Programs\\Python\\Python35\\python.exe C:\\Users\\pc-06\\git\\ssssssssss\\teamproject\\teamSsum\\WebContent\\py\\kakao_analysis_final_integrating.py");

			BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));

			String line = "";
			while ((line = bfr.readLine()) != null) {

			}

		} catch (Exception e) {

		}
	}
}