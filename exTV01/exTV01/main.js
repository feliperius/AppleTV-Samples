App.onLaunch = function(){
    var carregaRecurso = new CarregaRecursoJS(nativeResourceLoader.create());
    var doc  = ResourceLoaderExport.getDocument("view.tvml");
    navigationDocument.pushDocument(doc);
    
    doc.addEventListener("select",handleEvente);
    
}

class CarregaRecursoJS{
    constructor(nativeResourceLoader){
        this.nativeResourceLoader = nativeResourceLoader;
        
        this.domParser = new domParser();
    }
    
    getDocument(name){
        var docString = this.nativeResourceLoader.loadBundleResource(name);
        
        return this.domParser.parseFromString(docString,"application/xml");
    }

}

function platVideo(title,url){
    var player = new Player();
    
    var video = new MediaItem('video',url);
    video.title = title;
    player.playlist = new Playlist();
    player.playlist.push(video);
    
    player.play();
    
}

function handleEvente(event){
    var buttonId = event.target.getAttribute("id");
    if (buttonId === "play"){
        
        playVideo("Executar meu video!", "https://www.youtube.com/watch?v=YthChN1Wq8M");
     
    }
    
}