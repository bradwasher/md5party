# md5party extract files

export
{
        const ext_map: table[string] of string = {
                ["application/msword"] = "doc",
                ["application/vnd.openxmlformats-officedocument.wordprocessingml.document"] = "docx",
                ["application/x-dmg"] = "dmg",
                ["application/x-dosexec"] = "exe",
                ["application/x-msdownload"] = "exe",
                ["application/java-archive"] = "jar",
                ["application/x-java-applet"] = "jar",
                ["application/javascript"] = "js",
                ["text/x-perl"] = "pl",
                ["application/pdf"] = "pdf",
                ["application/mspowerpoint"] = "ppt",
                ["application/powerpoint"] = "ppt",
                ["application/vnd.openxmlformats-officedocument.presentationml.presentation"] ="pptx",
                ["text/x-script.python"] = "py",
                ["text/x-ruby"] = "rb",
                ["application/x-bsh"] = "sh",
                ["application/x-sh"] = "sh",
                ["application/x-font-ttf"] = "ttf",
                ["text/plain"] = "txt",
                ["application/excel"] = "xls",
                ["application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"] = "xlsx",
                ["application/xml"] = "xml"
        } &redef &default="";
}

redef FileExtract::prefix = "/data/md5party/extract";

event file_sniff(f: fa_file, meta: fa_metadata)
{
        local ext = "";

        if ( meta?$mime_type )
        {
                ext = ext_map[meta$mime_type];
        }

        if ( ext == "" )
        {
                return;
        }

        # Files::add_analyzer(f, Files::ANALYZER_MD5);

        local fname = fmt("%s-%s-%s", f$source, f$id, ext);
        Files::add_analyzer(f, Files::ANALYZER_EXTRACT, [$extract_filename=fname, $extract_limit=100]);

        local cmd = fmt("bash /data/md5party/md5party.sh /data/md5party/extract/%s-%s-%s", f$source, f$id, ext);
        system(cmd);
}
