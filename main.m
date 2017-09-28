files = dir('img');
for i = 1:size(files, 1)
    if (files(i).name=="." ||files(i).name=="..")
        continue;
    end
    path = [files(i).folder, '/', files(i).name];
    fprintf("Running on %s\n", files(i).name);
    cnnWithImg(path);
    [~,name,~] = fileparts(files(i).name);
    fprintf("Results of each layer are saved in result/%s\n", name);
end