## Uploading Issues to seapapers.library.cornell.edu

Updated - jgr25 8/31/2016

### Description

Basic information about uploading newspaper Issues and Issue Documents to the SEAPapers web site. Description of file formats and process.

### Data types

1. Publication
  * add new Publications via Drupal interface
2. Issue
  * Title
  * Body
  * Issue ID - unique name for this issue - text
    * calculated as a hash of publication, date, volume
  * Publication Reference - select the 'Title' of the Publication this issue belongs in - entity reference
  * Issue Date - date
  * Issue Volume - volume and issue number, varies by publication - text
  * note: no documet is stored with the Issue data type
3. Issue Part
  * Title
  * Issue Part ID - unique id for this part of the issue - text
    * calculated as a hash of issue, part order
  * Issue Part Order - number for setting the order of the parts. used ascending - float
  * Issue Part Document - uploaded file for this issue, allows multi-document issues - file
  * Issue Reference - select the 'Title' of Issue this part belongs in - entity reference
  * Issue Part Description - optional description for this article - text

### CSV file formats

2. Issue Import CSV File
  * /import/issue_import
  * template: issue_import_template.csv
3. Issue Part CSV file
  * /import/issue_parts_import
  * template: issue_parts_import_template.csv

## Procedure

1. Create publication node in Drupal if necessary.
2. Build csv file for issues. One record per issue. Be sure combined publication, date and volume are unique.
3. Import issues csv file.
4. Build csv file for issue parts. One record per document. Be sure combined issue and part order are unique.
5. Import issue parts csv file.

## Building the csv file

1. aws s3 ls seapapers.library.cornell.edu/issues/ --recursive > issues.txt
2.

## Parsing the aws s3 ls --recursive file

use \2 for substitutions:

publication /(\/.*?){1}([^\/]*)/
year (\/.*?){2}([^\/]*)
volume (\/.*?){3}([^\/]*)
part (\/.*?){4}([^\/]*)
filename (\/.*?){5}([^\/]*)

use \1 for substitution on extension:
extension \.([^\.]+)$

filename with separate extension
(\/.*?){5}([^\/]*)\.([^\.]+)$
\2 filename, \3 extension

publication,year,volume,part
(\/.*?){1}([^\/]*)\/([^\/]*)\/([^\/]*)\/([^\/]*)\/
\2,\3,\4,\5

## Amazon S3 naming conventions

- see [Object Naming Guidelines] (http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html)
- The following character sets are generally safe for use in key names:
  - Alphanumeric characters [0-9a-zA-Z]
  - Special characters !, -, _, ., *, ', (, and )

## Directory layout on Amamzon S3 bucket seapapers.library.cornell.edu

Example:
`seapapers.library.cornell.edu/issues/jati/2014/19-1/8/JATI_Vol_19-_08_DOES_SOCIAL_REMITTANCE_TAKE_PLACE_AMONG_INDONESIAN_PLANTATION_WORKERS_IN_MALAYSIA.pdf`

- Fields
  * bucket
		* always `seapapers.library.cornell.edu`
  * section
	    * always `issues`
  * publication
	    * in this case `jati`
	    * lower case letters and *
	    * transliteration of journal name from Cornell field "Title * Romaized by CUL"
  * year
	    * in this case `2014`
	    * year of pyblication for this issue part
  * volume/issue
	    * in this case `9-1`
	    * must be unique for all the issue parts in this publication
	    * alpha-numeric - see Amazon S3 naming conventions
	    * don't worry about sort order
  * issue part sequence number
	    * in this case `8`
	    * integer
	    * sorted numerically * don't use 01,02,etc. just 1,2,...
	    * must be unique within volume/issue
	    * determines which part of the issue is listed first, second, etc.
  * title of issue part
	    * in this case `JATI_Vol_19-_08_DOES_SOCIAL_REMITTANCE_TAKE_PLACE_AMONG_INDONESIAN_PLANTATION_WORKERS_IN_MALAYSIA.pdf`
	    * replace any blanks with _
	    * alpha-numeric - see Amazon S3 naming conventions
	    * include the proper file extension
	      * in this case .pdf

