package  com.jiuyv.common.lang.date;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateUtils
{
  public static String getCurDate()
  {
    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
    return format.format(Calendar.getInstance().getTime());
  }

  public static String getCurDateTime()
  {
    SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
    return format.format(Calendar.getInstance().getTime());
  }

  public static String getCurDay()
  {
    SimpleDateFormat format = new SimpleDateFormat("dd");
    return format.format(Calendar.getInstance().getTime());
  }

  public static String getCurMonth()
  {
    SimpleDateFormat format = new SimpleDateFormat("MM");
    return format.format(Calendar.getInstance().getTime());
  }

  public static String getCurTime()
  {
    SimpleDateFormat format = new SimpleDateFormat("HHmmss");
    return format.format(Calendar.getInstance().getTime());
  }

  public static String getCurYear()
  {
    SimpleDateFormat format = new SimpleDateFormat("yyyy");
    return format.format(Calendar.getInstance().getTime());
  }

  public static String getDate(int offset)
  {
    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
    Calendar calendar = Calendar.getInstance();
    calendar.add(5, offset);
    return format.format(calendar.getTime());
  }
}