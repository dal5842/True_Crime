<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <transcript>
            <xsl:apply-templates select="text"/>
        </transcript>          
    </xsl:template>
    
    <xsl:template match="text">
        <!-- Search for & and < > signs and escape them -->
        <xsl:variable name="escapedText" select="replace(replace(replace(., '&amp;', '&amp;amp;'), '&lt;', '&amp;lt;'), '&gt;', '&amp;gt;')"/>
        
        <!-- Remove extra blank lines -->
        <xsl:variable name="noExtraBlankLines" select="replace('\n\n\n+', '\n\n')"/>
        
        <!-- Combine split dialogue lines -->
        <xsl:variable name="combinedDialogue" select="replace('(?<!\n\n)\n(?!\n)', ' ')"/>
            
            <!-- Insert a new line after each line -->
            <xsl:variable name="linesWithBreaks" select="replace('(.+)', '$1\n')"/>
            
            <!-- Apply XML structure to each line -->
            <xsl:variable name="structuredText" select="replace('^(.+)$', '<scene>\n\t<type>Dialogue</type>\n\t<speaker>Unknown</speaker>\n\t<line>$1</line>\n</scene>')"/>
                
                <!-- Modify type to "music" if line contains ♪ -->
                <xsl:variable name="finalText" select="replace('(<scene>\s*<type>)Dialogue(</type>\s*<speaker>.*?</speaker>\s*<line>.*?♪.*?</line>\s*</scene>)', '$1music$2')"/>
                    
                    <xsl:value-of select="$finalText" disable-output-escaping="yes"/>
    </xsl:template>
</xsl:stylesheet>