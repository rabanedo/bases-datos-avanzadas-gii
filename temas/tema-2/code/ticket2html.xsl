<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:template match="/ticket">
    <html>
      <head>
        <title>Ticket <xsl:value-of select="@numero" /></title>
      </head>
      <body>
        <h1>Ticket de compra</h1>
        <p>
          <strong>Fecha:</strong>
          <xsl:value-of select="@fecha" />
        </p>
        <p>
          <strong>Ferretería:</strong>
          <xsl:value-of select="ferreteria/@nombre" />
        </p>
        <h2>Productos</h2>
        <ul>
          <xsl:for-each select="lineas/linea">
            <li>
              <xsl:value-of select="producto/descripcion" /> (<xsl:value-of select="cantidad" /> x <xsl:value-of
                select="precioUnitario" /> €) </li>
          </xsl:for-each>
        </ul>
        <h3>Total: <xsl:value-of select="totales/totalPagar" /> €</h3>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>