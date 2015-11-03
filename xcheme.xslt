<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

  <xsl:template match="/scheme">
      <xsl:apply-templates select="list | comment" />
  </xsl:template>

  <xsl:template match="comment">
      ;; <xsl:value-of select="node()" />
      <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="list">
    <xsl:if test="@escaped = 'true'">'</xsl:if>(<xsl:apply-templates select="symbol | list | comment" />)
  </xsl:template>

  <xsl:template match="symbol">
     <xsl:value-of select="node()" />
     <xsl:text>&#32;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
