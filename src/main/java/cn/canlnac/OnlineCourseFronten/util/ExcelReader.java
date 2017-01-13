package cn.canlnac.OnlineCourseFronten.util;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by can on 2017/1/13.
 * Java解析Excel文件
 */
public class ExcelReader {

    /**
     * 通过传入excel文件的完整路径。然后解析excel文件。
     * @param path
     * @return  ArrayList<ArrayList<ArrayList<String>>>
     */
    public static ArrayList<ArrayList<ArrayList<String>>> parseExcel(String path){
        ArrayList<ArrayList<ArrayList<String>>> sheets = new ArrayList<ArrayList<ArrayList<String>>>();

        Workbook workbook = null;
        try {
            //excel文件有两种格式(.xls(2003) , .xlsx(2007))
            //XSSFWorkbook  用来加载后缀名为 .xlsx 文件的
            workbook = new XSSFWorkbook(new FileInputStream(new File(path)));
        } catch (Exception ex) {
            try {
                //HSSFWorkbook  用来加载后缀名为 .xls 文件的
                workbook = new HSSFWorkbook(new FileInputStream(new File(path)));

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        //excel文件里面有很多的sheet, 要遍历每一张sheet
        for (int numSheet = 0; numSheet < workbook.getNumberOfSheets(); numSheet++) {
            Sheet sheet = workbook.getSheetAt(numSheet);
            if (sheet == null) {
                continue;
            }
            //每张sheet里面有很多的row, 要遍历每行
            ArrayList<ArrayList<String>> Row = new ArrayList<ArrayList<String>>();
            for (int rowNum = 0; rowNum <= sheet.getLastRowNum(); rowNum++) {
                Row row = sheet.getRow(rowNum);
                if (row == null) {
                    continue;
                }
                //每行都有很多列, 要遍历每列
                ArrayList<String> arrCell = new ArrayList<String>();
                for (int cellNum = 0; cellNum <= row.getLastCellNum(); cellNum++) {
                    Cell cell = row.getCell(cellNum);
                    if (cell == null) {
                        continue;
                    }
                    arrCell.add(getValue(cell));
                }
                Row.add(arrCell);
            }

            sheets.add(Row);

        }
        return sheets;
    }

    /*
     * 得到每个cell里面的值
     */
    private static String getValue(Cell cell) {
        if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
            //System.out.println(String.valueOf(cell.getBooleanCellValue()));
            return String.valueOf(cell.getBooleanCellValue());
        } else if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
            //System.out.println(String.valueOf(cell.getNumericCellValue()));
            return String.valueOf(cell.getNumericCellValue());
        } else {
            //System.out.println(String.valueOf(cell.getStringCellValue()));
            return String.valueOf(cell.getStringCellValue());
        }
    }
}
