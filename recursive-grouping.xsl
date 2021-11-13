<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mf="http://example.com/mf"
    exclude-result-prefixes="#all"
    version="3.0">

	<xsl:function name="mf:group" as="node()*">
		<xsl:param name="parents" as="node()*"/>
		<xsl:for-each-group select="$parents/*" composite="yes" group-by="node-name(), @id">
			<xsl:copy>
				<xsl:copy-of select="@*"/>
				<xsl:attribute name="count" select="count(current-group())"/>
				<xsl:sequence select="mf:group(current-group())"/>
			</xsl:copy>
		</xsl:for-each-group>
	</xsl:function>

	<xsl:template match="/">
		<xsl:sequence select="mf:group(.)"/>
	</xsl:template>

	<xsl:output method="xml" indent="yes" />

</xsl:stylesheet>
