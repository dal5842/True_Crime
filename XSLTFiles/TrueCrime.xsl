<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:variable name="textcoll" as="document-node()+" select="collection('EpisodesBasicXML/?select=*.xml')"/>
    
    <xsl:template match="/">
        <xsl:for-each select="$textcoll">
            <xsl:variable name="filename" as="xs:string" select="tokenize(base-uri(), '/')[last()]"/>
            <xsl:result-document method="xml" indent="yes" href="xml-output/{$filename}">
           <transcript>
              <xsl:apply-templates select="descendant::line"/>
        </transcript>
           </xsl:result-document>
        </xsl:for-each> 
    </xsl:template>
    
    <xsl:template match="line[matches(., '^♪')] | line[who='Lyrics']">
       <line type="music">
           <xsl:apply-templates/>
       </line>
    </xsl:template>
    
    <!--<xsl:template match="text">
     
        
        <!-\- Remove extra blank lines -\->
        <xsl:variable name="noExtraBlankLines" select="replace('\n\n\n+', '\n\n')"/>
        
        <!-\- Combine split dialogue lines -\->
        <xsl:variable name="combinedDialogue" select="replace('(?<!\n\n)\n(?!\n)', ' ')"/>
            
            <!-\- Insert a new line after each line -\->
            <xsl:variable name="linesWithBreaks" select="replace('(.+)', '$1\n')"/>
            
            <!-\- Apply XML structure to each line -\->
            <xsl:variable name="structuredText" select="replace('^(.+)$', '<scene>\n\t<type>Dialogue</type>\n\t<speaker>Unknown</speaker>\n\t<line>$1</line>\n</scene>')"/>
                
                <!-\- Modify type to "music" if line contains ♪ -\->
                <xsl:variable name="finalText" select="replace('(<scene>\s*<type>)Dialogue(</type>\s*<speaker>.*?</speaker>\s*<line>.*?♪.*?</line>\s*</scene>)', '$1music$2')"/>
                    
                    <xsl:value-of select="$finalText" disable-output-escaping="yes"/>
    </xsl:template>-->
</xsl:stylesheet>