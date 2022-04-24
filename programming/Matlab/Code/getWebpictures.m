N = input('Input the number you want to download:');
    URL = 'https://www.nasa.gov/api/2/ubernode/_search';
mainURL = 'https://www.nasa.gov/sites/default/files/';
opt = weboptions('Timeout',10);
for i=1:N
    data = webread(URL,'size',num2str(N),'from','0','sort','promo-date-time:desc','q','((ubernode-type:image) AND (routes:1446))','_source_include','promo-date-time,master-image,nid,title,topics,missions,collections,other-tags,ubernode-type,primary-tag,secondary-tag,cardfeed-title,type,collection-asset-link,link-or-attachment,pr-leader-sentence,image-feature-caption,attachments,uri',opt);
    imgURL = append(mainURL,data.hits.hits(i).x_source.master_image.uri(10:end));
    img = webread(imgURL,opt);
    filename = append('Img_',num2str(i),'_',data.hits.hits(i).x_source.master_image.title,'.jpg');
	imwrite(img,filename);
    disp(append('FINISHED:',num2str(i),'/',num2str(N)));
end
disp('Completed!');



