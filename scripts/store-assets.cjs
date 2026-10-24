// Deterministic Store tile assets from the existing project icon; no new artwork.
const {app,nativeImage}=require('electron');const fs=require('node:fs');const path=require('node:path');
app.whenReady().then(()=>{
  const out=path.resolve(__dirname,'../build/appx');fs.mkdirSync(out,{recursive:true});
  const icon=nativeImage.createFromPath(path.resolve(__dirname,'../desktop/icon.png'));
  if(icon.isEmpty())throw Error('Project icon unavailable');
  for(const[name,w,h]of[['StoreLogo',50,50],['Square44x44Logo',44,44],['Square150x150Logo',150,150],['Wide310x150Logo',310,150]]){
    // Preserve the icon's proportions; center square artwork in the wide tile.
    const size=Math.min(w,h),small=icon.resize({width:size,height:size,quality:'best'});
    let tile=small;
    if(w!==h){const bitmap=Buffer.alloc(w*h*4),source=small.toBitmap(),left=Math.floor((w-size)/2);for(let y=0;y<size;y++)source.copy(bitmap,(y*w+left)*4,y*size*4,(y+1)*size*4);tile=nativeImage.createFromBitmap(bitmap,{width:w,height:h});}
    fs.writeFileSync(path.join(out,name+'.png'),tile.toPNG());
  }
  app.quit();
}).catch(e=>{console.error(e);app.exit(1)});
