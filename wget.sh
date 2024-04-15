#!/bin/sh

#
# Generated on Mon Apr 15 05:31:29 PDT 2024
# Start of user configurable variables
#
LANG=C
export LANG

#Trap to cleanup cookie file in case of unexpected exits.
trap 'rm -f $COOKIE_FILE; exit 1' 1 2 3 6 

# SSO username 
printf 'SSO User Name:' 
read SSO_USERNAME

# Path to wget command
WGET=/usr/bin/wget

# Log directory and file
LOGDIR=.
LOGFILE=$LOGDIR/wgetlog-$(date +%m-%d-%y-%H:%M).log

# Print wget version info 
echo "Wget version info: 
------------------------------
$($WGET -V) 
------------------------------" > "$LOGFILE" 2>&1 

# Location of cookie file 
COOKIE_FILE=$(mktemp -t wget_sh_XXXXXX) >> "$LOGFILE" 2>&1 
if [ $? -ne 0 ] || [ -z "$COOKIE_FILE" ] 
then 
 echo "Temporary cookie file creation failed. See $LOGFILE for more details." |  tee -a "$LOGFILE" 
 exit 1 
fi 
echo "Created temporary cookie file $COOKIE_FILE" >> "$LOGFILE" 

# Output directory and file
OUTPUT_DIR=.
#
# End of user configurable variable
#

# The following command to authenticate uses HTTPS. This will work only if the wget in the environment
# where this script will be executed was compiled with OpenSSL.
# 
 $WGET  --secure-protocol=auto --save-cookies="$COOKIE_FILE" --keep-session-cookies --http-user "$SSO_USERNAME" --ask-password  "https://edelivery.oracle.com/osdc/cliauth" -a "$LOGFILE"

# Verify if authentication is successful 
if [ $? -ne 0 ] 
then 
 echo "Authentication failed with the given credentials." | tee -a "$LOGFILE"
 echo "Please check logfile: $LOGFILE for more details." 
else
 echo "Authentication is successful. Proceeding with downloads..." >> "$LOGFILE" 
 $WGET  --load-cookies="$COOKIE_FILE" --save-cookies="$COOKIE_FILE" --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V1036331-01.zip&token=b1NKYXZpRm5tZnM3QjQxTEJPZFVhQSE6OiFmaWxlSWQ9MTE3MDU1NzcxJmZpbGVTZXRDaWQ9MTEyNTA1MSZyZWxlYXNlQ2lkcz0xMTA2OTE0JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjEmYWdyZWVtZW50SWQ9MTA2Nzc3MjYmZW1haWxBZGRyZXNzPXNpbW9uQGdhbmN6LmNvbSZ1c2VyTmFtZT1FUEQtU0lNT05AR0FOQ1ouQ09NJmlwQWRkcmVzcz0zNS4xNzcuNS4xOTImdXNlckFnZW50PU1vemlsbGEvNS4wIChYMTE7IExpbnV4IHg4Nl82NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEyMS4wLjAuMCBTYWZhcmkvNTM3LjM2JmNvdW50cnlDb2RlPUdC" -O "$OUTPUT_DIR/V1036331-01.zip" >> "$LOGFILE" 2>&1 
 $WGET --load-cookies="$COOKIE_FILE" "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V983364-01.zip&token=SDl0d08rT3NQVWpudWpVT2grWW5RUSE6OiFmaWxlSWQ9MTA1ODAwMDA5JmZpbGVTZXRDaWQ9OTEyMDIzJnJlbGVhc2VDaWRzPTg0Nzg3MyZwbGF0Zm9ybUNpZHM9MzUmZG93bmxvYWRUeXBlPTk1NzY0JmFncmVlbWVudElkPTEwNjc3NzI2JmVtYWlsQWRkcmVzcz1zaW1vbkBnYW5jei5jb20mdXNlck5hbWU9RVBELVNJTU9OQEdBTkNaLkNPTSZpcEFkZHJlc3M9MzUuMTc3LjUuMTkyJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoWDExOyBMaW51eCB4ODZfNjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMjEuMC4wLjAgU2FmYXJpLzUzNy4zNiZjb3VudHJ5Q29kZT1HQiZkbHBDaWRzPTEwOTI0Nzk" -O "$OUTPUT_DIR/V983364-01.zip" >> "$LOGFILE" 2>&1 
fi 

# Cleanup
rm -f "$COOKIE_FILE" 
echo "Removed temporary cookie file $COOKIE_FILE" >> "$LOGFILE" 

