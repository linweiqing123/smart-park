package util;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.OutputStream;
import java.io.Writer;
import java.text.SimpleDateFormat;

public abstract class JSONUtils {

	private static ObjectMapper objectMapper = new ObjectMapper();

	static {

		// 设置日期格式化
		objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		// 设置null不序列化
		objectMapper.setSerializationInclusion(Include.NON_NULL);
	}

	private JSONUtils() {

	}

	public static void writeValue(OutputStream out, Object value) {
		try {
			objectMapper.writeValue(out, value);
		} catch (Exception e) {
			throw new RuntimeException(e.toString(), e);
		}
	}

	public static void writeValue(Writer w, Object value) {
		try {
			objectMapper.writeValue(w, value);
		} catch (Exception e) {
			throw new RuntimeException(e.toString(), e);
		}
	}

	public static String writeValueAsString(Object arg0) {
		try {
			return objectMapper.writeValueAsString(arg0);
		} catch (Exception e) {
			throw new RuntimeException(e.toString(), e);
		}
	}
	

}
