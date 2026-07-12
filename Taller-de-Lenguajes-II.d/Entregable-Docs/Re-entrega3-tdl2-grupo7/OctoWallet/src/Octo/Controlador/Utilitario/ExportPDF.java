package Octo.Controlador.Utilitario;

import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.HorizontalAlignment;
import com.itextpdf.layout.properties.TextAlignment;
import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.table.TableModel;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;


public class ExportPDF {
    public static void printToPDF(JTable table) {
        String filePath = ExportCSV.getDownloadsFolderPath().toString() + "/Mis Activos.pdf";

        try {

            PdfWriter writer = new PdfWriter(filePath);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);

            // Agrego el titulo
            Paragraph title = new Paragraph("Mis Activos")
                    .setTextAlignment(TextAlignment.CENTER)
                    .setFontSize(20).setUnderline();
            document.add(title);
            // Salto de linea
            document.add(new Paragraph("\n"));

            Table pdfTable = new Table(table.getColumnCount());
            TableModel model = table.getModel();
            pdfTable.setHorizontalAlignment(HorizontalAlignment.CENTER);
            // Agrego el encabezado de la tabla
            pdfTable.addHeaderCell(new Cell().add(new Paragraph("").setTextAlignment(TextAlignment.CENTER)));
            pdfTable.addHeaderCell(new Cell().add(new Paragraph("Moneda").setTextAlignment(TextAlignment.CENTER)));
            pdfTable.addHeaderCell(new Cell().add(new Paragraph(model.getColumnName(2)).setTextAlignment(TextAlignment.CENTER)));
            // Agrego las filas de la tabla
            for (int row = 0; row < model.getRowCount(); row++) {
                for (int col = 0; col < model.getColumnCount(); col++) {
                    Object value = model.getValueAt(row, col);
                    if (value instanceof ImageIcon) {
                        ImageIcon icon = (ImageIcon) value;
                        try {
                            BufferedImage bufferedImage = new BufferedImage(icon.getIconWidth(), icon.getIconHeight(), BufferedImage.TYPE_INT_ARGB);
                            java.awt.Image img = icon.getImage();
                            bufferedImage.getGraphics().drawImage(img, 0, 0, null);
                            ByteArrayOutputStream baos = new ByteArrayOutputStream();
                            ImageIO.write(bufferedImage, "png", baos);
                            com.itextpdf.layout.element.Image pdfImage = new com.itextpdf.layout.element.Image(ImageDataFactory.create(baos.toByteArray()));
                            pdfTable.addCell(new Cell().add(pdfImage));
                        } catch (IOException e) {
                            pdfTable.addCell(new Cell().add(new Paragraph("Image not found")));
                        }
                    } else {
                        pdfTable.addCell(new Cell().add(new Paragraph(value.toString())));
                    }
                }
            }

            document.add(pdfTable);
            document.close();

            JOptionPane.showMessageDialog(null, "PDF exportado exitosamente a" + filePath);
        } catch (FileNotFoundException e) {
            JOptionPane.showMessageDialog(null, "Error exportando PDF: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}