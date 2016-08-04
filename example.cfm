<!--- Get typecodes from database --->
<cfquery name="comment_reasons2" datasource="#client.ds#">
    SELECT
	a.id
    , a.name

	, b.id
    , b.name

	, c.id
    , c.name

    FROM tabble1 as a
    , tabble2 as b
    , tabble3 as c
    WHERE b.fktable1id = a.id
    AND c.fktable3id = b.id
    ORDER BY
    a.name
    , b.name
    , c.name
</cfquery>

<cfoutput>
       <table class="input" style="border:none">
       <tr>
       <td>
       <strong>Main reason:</strong><br />
			<!---Customized  tag should without empty text, otherwise, the 3rd field is going to be wrong--->
            <CF_ThreeSelectsRelated
			QUERY="comment_reasons2"
			Type1="Select"
			HTMLAFTER1="</td><td><strong>Reason type:</strong><br/>"
            HTMLAFTER2="</td><td><strong>Outcome:</strong><br/>"
			NAME1="reason_code"
			NAME2="reasontype_code"
			NAME3="reasonchoice_code"
            EMPTYTEXT1="Choose Main"
			EMPTYTEXT2="Choose Type"
			EMPTYTEXT3="Choose Outcome"
			VALUE1="comments_reasonid"
			VALUE2="comments_reasontypeid"
			VALUE3="comments_reasonchoiceid"
			Value1Required="true"
			Value2Required="true"
			Value3Required="true"
			DISPLAY1="reason_code"
			DISPLAY2="reasontype_code"
			DISPLAY3="reasonchoice_code"
			SIZE1="1"
			SIZE2="1"
			SIZE3="1"
            <!---Default ID you want to have on each option.
            DEFAULT1="11"
            DEFAULT2="82"
            DEFAULT3="953"--->
            <!---End of had code--->
			WIDTH1="200"
			WIDTH2="200"
			WIDTH3="200"
			AUTOSELECTFIRST="YES"
            FORMNAME="add_comment"
			MULTIPLE3="NO"
            >
        </td>
        </tr>
        </table>
</cfoutput>
