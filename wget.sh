#!/bin/sh

#
# Generated on Wed Mar 20 03:12:11 PDT 2024
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
 $WGET  --load-cookies="$COOKIE_FILE" --save-cookies="$COOKIE_FILE" --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V1036331-01.zip&token=Y3JOYWl5ZllLMDE0cnZ3RjdxRWFnZyE6OiFmaWxlSWQ9MTE3MDU1NzcxJmZpbGVTZXRDaWQ9MTEyNTA1MSZyZWxlYXNlQ2lkcz0xMTA2OTE0JnBsYXRmb3JtQ2lkcz0zNSZkb3dubG9hZFR5cGU9OTU3NjEmYWdyZWVtZW50SWQ9MTA2MDI2NjQmZW1haWxBZGRyZXNzPXNpbW9uQGdhbmN6LmNvbSZ1c2VyTmFtZT1FUEQtU0lNT05AR0FOQ1ouQ09NJmlwQWRkcmVzcz05NC4wLjE1MS4xNTImdXNlckFnZW50PU1vemlsbGEvNS4wIChNYWNpbnRvc2g7IEludGVsIE1hYyBPUyBYIDEwXzE1XzcpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS8xMjIuMC4wLjAgU2FmYXJpLzUzNy4zNiZjb3VudHJ5Q29kZT1HQg" -O "$OUTPUT_DIR/V1036331-01.zip" >> "$LOGFILE" 2>&1 
 $WGET  --load-cookies="$COOKIE_FILE" --save-cookies="$COOKIE_FILE" --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V983367-01.zip&token=emtPWU1MRzJYTHAxWVJGdDhKSEYrQSE6OiFmaWxlSWQ9MTA1ODM4MjE5JmZpbGVTZXRDaWQ9OTEyMTExJnJlbGVhc2VDaWRzPTg0Nzg1OCZwbGF0Zm9ybUNpZHM9MzUmZG93bmxvYWRUeXBlPTk1NzY0JmFncmVlbWVudElkPTEwNjAyNjY0JmVtYWlsQWRkcmVzcz1zaW1vbkBnYW5jei5jb20mdXNlck5hbWU9RVBELVNJTU9OQEdBTkNaLkNPTSZpcEFkZHJlc3M9OTQuMC4xNTEuMTUyJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTIyLjAuMC4wIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9R0ImZGxwQ2lkcz0xMDkyNDc5" -O "$OUTPUT_DIR/V983367-01.zip" >> "$LOGFILE" 2>&1 
 $WGET  --load-cookies="$COOKIE_FILE" --save-cookies="$COOKIE_FILE" --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V983356-01.zip&token=ZkNWbmFEcmVnR3hHM3RqL241ZHJHZyE6OiFmaWxlSWQ9MTA1ODAxNTcyJmZpbGVTZXRDaWQ9OTEyMTA2JnJlbGVhc2VDaWRzPTg0Nzg3MyZwbGF0Zm9ybUNpZHM9MzUmZG93bmxvYWRUeXBlPTk1NzY0JmFncmVlbWVudElkPTEwNjAyNjY0JmVtYWlsQWRkcmVzcz1zaW1vbkBnYW5jei5jb20mdXNlck5hbWU9RVBELVNJTU9OQEdBTkNaLkNPTSZpcEFkZHJlc3M9OTQuMC4xNTEuMTUyJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTIyLjAuMC4wIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9R0ImZGxwQ2lkcz0xMDkyNDc5" -O "$OUTPUT_DIR/V983356-01.zip" >> "$LOGFILE" 2>&1 
 $WGET  --load-cookies="$COOKIE_FILE" --save-cookies="$COOKIE_FILE" --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V983365-01.zip&token=R3QwdUJvcWs3bUYzM2k5YUMwN2RvQSE6OiFmaWxlSWQ9MTA1ODE0NzI1JmZpbGVTZXRDaWQ9OTEyMTA5JnJlbGVhc2VDaWRzPTg0Nzg3MyZwbGF0Zm9ybUNpZHM9MzUmZG93bmxvYWRUeXBlPTk1NzY0JmFncmVlbWVudElkPTEwNjAyNjY0JmVtYWlsQWRkcmVzcz1zaW1vbkBnYW5jei5jb20mdXNlck5hbWU9RVBELVNJTU9OQEdBTkNaLkNPTSZpcEFkZHJlc3M9OTQuMC4xNTEuMTUyJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTIyLjAuMC4wIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9R0ImZGxwQ2lkcz0xMDkyNDc5" -O "$OUTPUT_DIR/V983365-01.zip" >> "$LOGFILE" 2>&1 
 $WGET  --load-cookies="$COOKIE_FILE" --save-cookies="$COOKIE_FILE" --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V983364-01.zip&token=ZjZoS3lZQk5hb1hlbmJIN3o1L1dFUSE6OiFmaWxlSWQ9MTA1ODAwMDA5JmZpbGVTZXRDaWQ9OTEyMDIzJnJlbGVhc2VDaWRzPTg0Nzg3MyZwbGF0Zm9ybUNpZHM9MzUmZG93bmxvYWRUeXBlPTk1NzY0JmFncmVlbWVudElkPTEwNjAyNjY0JmVtYWlsQWRkcmVzcz1zaW1vbkBnYW5jei5jb20mdXNlck5hbWU9RVBELVNJTU9OQEdBTkNaLkNPTSZpcEFkZHJlc3M9OTQuMC4xNTEuMTUyJnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xNV83KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTIyLjAuMC4wIFNhZmFyaS81MzcuMzYmY291bnRyeUNvZGU9R0ImZGxwQ2lkcz0xMDkyNDc5" -O "$OUTPUT_DIR/V983364-01.zip" >> "$LOGFILE" 2>&1 
 $WGET --load-cookies="$COOKIE_FILE" "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V1034090-01.zip&token=TzhwYXBTcG9JOTFHaFcwY1JhckdHUSE6OiFmaWxlSWQ9MTE2MzA3MTEyJmZpbGVTZXRDaWQ9MTExMzIzMiZyZWxlYXNlQ2lkcz04NDc4NzMmcGxhdGZvcm1DaWRzPTM1JmRvd25sb2FkVHlwZT05NTc2NCZhZ3JlZW1lbnRJZD0xMDYwMjY2NCZlbWFpbEFkZHJlc3M9c2ltb25AZ2FuY3ouY29tJnVzZXJOYW1lPUVQRC1TSU1PTkBHQU5DWi5DT00maXBBZGRyZXNzPTk0LjAuMTUxLjE1MiZ1c2VyQWdlbnQ9TW96aWxsYS81LjAgKE1hY2ludG9zaDsgSW50ZWwgTWFjIE9TIFggMTBfMTVfNykgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEyMi4wLjAuMCBTYWZhcmkvNTM3LjM2JmNvdW50cnlDb2RlPUdCJmRscENpZHM9MTA5MjQ3OQ" -O "$OUTPUT_DIR/V1034090-01.zip" >> "$LOGFILE" 2>&1 
fi 

# Cleanup
rm -f "$COOKIE_FILE" 
echo "Removed temporary cookie file $COOKIE_FILE" >> "$LOGFILE" 

