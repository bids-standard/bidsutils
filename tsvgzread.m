function [out_arr] = tsvgzread(filename)
    fileStream = java.io.FileInputStream(filename);
    gzipStream = java.util.zip.GZIPInputStream(fileStream);
    decoder = java.io.InputStreamReader(gzipStream);
    buffered = java.io.BufferedReader(decoder);

    out_arr = [];
    while 1
        line = buffered.readLine();
        if isempty(line)
            break
        end
        out_arr = [out_arr; str2num(line)];
    end
end
