package com.jiuyv.common.txt;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CSVUtil {
	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(CSVUtil.class);
    // CSV文件编码
    public static final String ENCODE = "UTF-8";

    private FileInputStream fis = null;
    private InputStreamReader isw = null;
    private BufferedReader br = null;

   
    public CSVUtil(String filename) throws Exception {
        fis = new FileInputStream(filename);
        isw = new InputStreamReader(fis, ENCODE);
        br = new BufferedReader(isw);
    }

    // ==========以下是公开方法=============================
    /**
     * 从CSV文件流中读取一个CSV行。
     *
     * @throws Exception
     */
    public String readLine() throws Exception {

        StringBuffer readLine = new StringBuffer();
        boolean bReadNext = true;

        while (bReadNext) {
            //
            if (readLine.length() > 0) {
                readLine.append("\r\n");
            }
            // 一行
            String strReadLine = br.readLine();

            // readLine is Null
            if (strReadLine == null) {
                return null;
            }
            readLine.append(strReadLine);

            // 如果双引号是奇数的时候继续读取。考虑有换行的是情况。
            if (countChar(readLine.toString(), '"', 0) % 2 == 1) {
                bReadNext = true;
            } else {
                bReadNext = false;
            }
        }
        return readLine.toString();
    }

    /**
     *把CSV文件的一行转换成字符串数组。指定数组长度，不够长度的部分设置为null。
     */
    public static String[] fromCSVLine(String source, int size) {
        ArrayList tmpArray = fromCSVLinetoArray(source);
        if (size < tmpArray.size()) {
            size = tmpArray.size();
        }
        String[] rtnArray = new String[size];
        tmpArray.toArray(rtnArray);
        return rtnArray;
    }
    
    /**
     * 导出
     * 
     * @param file csv文件(路径+文件名)，csv文件不存在会自动创建
     * @param dataList 数据
     * @return
     */
    public static boolean exportCSV(File file, List<String> dataList){
        boolean isSucess=false;
        
        FileOutputStream out=null;
        OutputStreamWriter osw=null;
        BufferedWriter bw=null;
        try {
            out = new FileOutputStream(file);
            osw = new OutputStreamWriter(out,"GBK");
            bw =new BufferedWriter(osw);
            if(dataList!=null && !dataList.isEmpty()){
                for(String data : dataList){
                    bw.append(data).append("\r");
                }
            }
            isSucess=true;
        } catch (Exception e) {
            isSucess=false;
        }finally{
            if(bw!=null){
                try {
                    bw.close();
                    bw=null;
                } catch (IOException e) {
                    LOGGER.error("", e);
                } 
            }
            if(osw!=null){
                try {
                    osw.close();
                    osw=null;
                } catch (IOException e) {
                    LOGGER.error("", e);
                } 
            }
            if(out!=null){
                try {
                    out.close();
                    out=null;
                } catch (IOException e) {
                    LOGGER.error("", e);
                } 
            }
        }
        
        return isSucess;
    }
    
    /**
     * 导出
     * 
     * @param file csv文件(路径+文件名)，csv文件不存在会自动创建
     * @param dataList 数据
     * @return
     */
    public static void exportCSV(List<String> dataList, ByteArrayOutputStream out){
        OutputStreamWriter osw = null;
        BufferedWriter bw = null;
        try {
            osw = new OutputStreamWriter(out,"GBK");
            bw = new BufferedWriter(osw);
            if(dataList != null && !dataList.isEmpty()){
                for(String data : dataList){
                	replaceTrim(data);
                    bw.append(data).append("\r\n");
                }
            }
        } catch (Exception e) {
            LOGGER.error("error to export csv file",e);
        }finally{
            if(bw!=null){
                try {
                    bw.close();
                    bw=null;
                } catch (IOException e) {
                	LOGGER.error("error to export csv file",e);
                } 
            }
            if(osw!=null){
                try {
                    osw.close();
                    osw = null;
                } catch (IOException e) {
                	LOGGER.error("error to export csv file",e);
                } 
            }
            if(out!=null){
                try {
                    out.close();
                    out = null;
                } catch (IOException e) {
                	LOGGER.error("error to export csv file",e);
                } 
            }
        }
    }
    
    /**
     * 把CSV文件的一行转换成字符串数组。不指定数组长度。
     */
    public static ArrayList fromCSVLinetoArray(String source) {
        if (source == null || source.length() == 0) {
            return new ArrayList();
        }
        int currentPosition = 0;
        int maxPosition = source.length();
        int nextComma = 0;
        ArrayList rtnArray = new ArrayList();
        while (currentPosition < maxPosition) {
            nextComma = nextComma(source, currentPosition);
            rtnArray.add(nextToken(source, currentPosition, nextComma));
            currentPosition = nextComma + 1;
            if (currentPosition == maxPosition) {
                rtnArray.add("");
            }
        }
        return rtnArray;
    }


    /**
     * 把字符串类型的数组转换成一个CSV行。（输出CSV文件的时候用）
     */
    public static String toCSVLine(String[] strArray) {
        if (strArray == null) {
            return "";
        }
        StringBuffer cvsLine = new StringBuffer();
        for (int idx = 0; idx < strArray.length; idx++) {
            String item = addQuote(strArray[idx]);
            cvsLine.append(item);
            if (strArray.length - 1 != idx) {
                cvsLine.append(',');
            }
        }
        return cvsLine.toString();
    }

    /**
     * 字符串类型的List转换成一个CSV行。（输出CSV文件的时候用）
     */
    public static String toCSVLine(List<String> strArrList) {
        if (strArrList == null) {
            return "";
        }
        String[] strArray = new String[strArrList.size()];
        for (int idx = 0; idx < strArrList.size(); idx++) {
            strArray[idx] = (String) strArrList.get(idx);
        }
        return toCSVLine(strArray);
    }

    // ==========以下是内部使用的方法=============================
    /**
     *计算指定文字的个数。
     *
     * @param str 文字列
     * @param c 文字
     * @param start  开始位置
     * @return 个数
     */
    private int countChar(String str, char c, int start) {
        int i = 0;
        int index = str.indexOf(c, start);
        return index == -1 ? i : countChar(str, c, index + 1) + 1;
    }

    /**
     * 查询下一个逗号的位置。
     *
     * @param source 文字列
     * @param st  检索开始位置
     * @return 下一个逗号的位置。
     */
    private static int nextComma(String source, int st) {
        int maxPosition = source.length();
        boolean inquote = false;
        while (st < maxPosition) {
            char ch = source.charAt(st);
            if (!inquote && ch == ',') {
                break;
            } else if ('"' == ch) {
                inquote = !inquote;
            }
            st++;
        }
        return st;
    }

    /**
     * 取得下一个字符串
     */
    private static String nextToken(String source, int st, int nextComma) {
        StringBuffer strb = new StringBuffer();
        int next = st;
        while (next < nextComma) {
            char ch = source.charAt(next++);
            if (ch == '"') {
                if ((st + 1 < next && next < nextComma) && (source.charAt(next) == '"')) {
                    strb.append(ch);
                    next++;
                }
            } else {
                strb.append(ch);
            }
        }
        return strb.toString();
    }

    /**
     * 在字符串的外侧加双引号。如果该字符串的内部有双引号的话，把"转换成""。
     *
     * @param item  字符串
     * @return 处理过的字符串
     */
    private static String addQuote(String item) {
        if (item == null || item.length() == 0) {
            return "";
        }
        boolean hasQuote = false;
        StringBuffer sb = new StringBuffer();
        //sb.append('"');
        for (int idx = 0; idx < item.length(); idx++) {
            char ch = item.charAt(idx);
            if (',' == ch) {
            	hasQuote = true;
            }
            if ('"' == ch) {
                sb.append("\"\"");
            } else {
                sb.append(ch);
            }
        }
        //sb.append('"');
        if (hasQuote) {
        	sb.insert(0,'"');
        	sb.append('"');
        }
        return sb.toString();
    }
    
    private static String replaceTrim(String str) throws Exception{
		String temp=str.trim();
		temp=str.replace("\r\n", "");
		temp=str.replace("\r", "");
		temp=str.replace("\n", "");
		return temp;
	}
    
    public static void main(String[] args) {
    	// I,854290065130354,上海中电大厦企业管理有限公司,上海中电大厦企业管理有限公司,,2900,浦东新区东陆路88号,0848540000,1,310115000068363,6513,00,0,AN004,,
    	List<String> sl = new ArrayList<String>();
    	sl.add("I");
    	sl.add("854290065130354");
    	sl.add("上海中电大,厦企业\"\"管理有限公司");
    	sl.add("上海中电大厦企业管理有限公司");
    	sl.add("");
    	sl.add("2900");
    	sl.add("浦东新区东陆路88号");
    	sl.add("0848540000");
    	sl.add("310115000068363");
    	sl.add("1");
    	sl.add("6513");
    	sl.add("00");
    	sl.add("0");
    	sl.add("AN004");
    	sl.add("");
    	List<String> dataList = new ArrayList<String>();
    	dataList.add(toCSVLine(sl));
    	System.out.println("I,854290065130354,上海中电大厦企业管理有限公司,上海中电大厦企业管理有限公司,,2900,浦东新区东陆路88号,0848540000,1,310115000068363,6513,00,0,AN004,,");
    	System.out.println("toCSVLine:"+toCSVLine(sl));
    	exportCSV(new File("D:\\work\\com\\jiuyv\\youle\\export.txt"),dataList);
    }
}
