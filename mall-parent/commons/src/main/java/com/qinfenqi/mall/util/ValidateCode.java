package com.qinfenqi.mall.util;

import java.util.Arrays;

public class ValidateCode {

	public enum ValidateCodeLevel {
		Simple, Medium, Hard
	};

	public static String getValidateCode() {
		return getValidateCode(4, ValidateCodeLevel.Medium, true);
	}

	private static String getValidateCode(int i, ValidateCodeLevel level, boolean b) {
		int size = i;
		char[] codes = {'2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		if (level.equals(ValidateCodeLevel.Simple)) {
			codes = Arrays.copyOfRange(codes, 0, 9);
		} else if (level.equals(ValidateCodeLevel.Medium)) {
			codes = Arrays.copyOfRange(codes, 0, 33);
		}
		int n = codes.length;
		char[] results = new char[size];

		if (b) {
			for (int j = 0; j < results.length; j++) {
				int r = (int) (Math.random() * n);
				results[j] = codes[r];
			}
		} else {
			for (int j = 0; j < results.length; j++) {
				int r = (int) (Math.random() * n);
				results[j] = codes[r];
				codes[r] = codes[n - 1];
				i--;
			}
		}
		return String.valueOf(results);

	}

}
