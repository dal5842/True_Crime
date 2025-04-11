<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="3.0"
    name="main">
    
    <p:option name="input-file" required="true" as="xs:string"/>
    <p:option name="xslt-file" select="'structure-transcript.xsl'" as="xs:string"/>
    
    <p:input port="source">
        <p:document href="{$input-file}" content-type="text/plain"/>
    </p:input>
    
    <p:output port="result"/>
    
    <p:wrap-sequence wrapper="text">
        <p:with-input select="/"/>
    </p:wrap-sequence>
    
    <p:xslt>
        <p:with-input port="stylesheet">
            <p:document href="{$xslt-file}"/>
        </p:with-input>
    </p:xslt>
    
</p:declare-step>