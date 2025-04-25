package edu.itstep.teacherapp.util;

import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@Component
public class DateFormatter implements Formatter<Date> {

    private final SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy");

    @Override
    public Date parse(String text, Locale locale) throws ParseException {
        if (text == null || text.isEmpty()) {
            return null;
        }
        return formatter.parse(text);
    }

    @Override
    public String print(Date date, Locale locale) {
        if (date == null) {
            return "";
        }
        return formatter.format(date);
    }
}
