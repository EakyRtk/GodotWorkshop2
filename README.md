# Bu Atölye Hakkında
- Bu atölye genel bir giriş sunacaktır ve her şeyin en optimize ve en iyi yoluna değinmektense, yeni başlayanlar için bir giriş sunacaktır. Bu atölyede; Godot ile basit bir oyun yapacak, daha sonrasında ilerleyen atölyelerde daha derinlerine ineceğiz. Bu dosyanın sonunda bazı yararlı kaynakları da bırakmış olacağım.
- # Godot Engine Nedir
- Godot açık kaynak kodlu bir oyun motorudur. 2d ve 3d oyunlar üretip bunu bilgisayar, mobil, web, vr, konsol gibi birçok platforma aktarabilmenizi sağlar. Açık kaynak kodlu olmasından dolayı konsollara direkt export alınamıyor, kendiniz veya hizmet veren başkasından portlatmanız gerekiyor.  Ancak açık kaynak kodlu olmasından dolayı sadece oyun üretmek dışında motorun bir kopyası üzerinde oynamalar yapıp kendinize uygun bir motora çevirebilir, kendi oyun motorunuzu oluşturabilir veya farklı aplikasyonlar yapabilirsiniz. Örneğin bunlara RPG in Box ve Material Maker örnek verilebilir.

Proje içi sunumdaki video Godot resmi YouTube videosundan alıntıdır. Tam haline [buradan](https://youtu.be/n1Lon_Q2T18?si=-mdzCeCwo1h0thcF) ulaşabilirsiniz.

- # Godot'un Yapısı
- Godotta nodeları bir tree/ağaç yapısına dizip sahneler oluşturur ve sinyaller aracılığıyla birbirlerini iletişim kurmalarını sağlayarak oyun yapısı sağlarız. Şimdi bunlara detaylıca değinelim.
- ![image.png](sunu-assets/image_1742588891587_0.png)
- Godot'ta 'node' denen belirli işlevleri gören yapı bloklarını bir araya getirip bir sahne üretiriz. Örneğin; görsel node, ses oynatma node, cooldown için bir zamanlayıcı node gibi nodeleri bir araya getirip oyuncu sahnesi üretebilir, bu sahneyi de Level1 adındaki bir sahneye bir node gibi ekleyip oyunumuzu oluşturabiliriz.
- Godot'un avantajlı yanı ise bu nodeleri kompozisyon yöntemi ile bir araya getirme konusunda benzer motorlara göre daha odaklı olması ve burada geliştiricilerin işini kolaylaştıracakl eklemesidir. Örneğin; her ne kadar nodelere tek bir script ekleyebilsek de, görevleri farklı bloklara bölmek ve onlar arasında iletişim kurmak daha kolaydır.
- Bu konuda temel ögelerden sinyallere geliyoruz. Bir benzetme ile başlayalım. Oyuncumuz bir hasar alıyor. Can barının yeni cana göre değer değiştirmesini, canımızın ne kadar kaldığını gösteren sayı yazısını değiştirmek istiyoruz. Tüm bu değişiklikleri oyuncu koduna ekleyebiliriz ama her nodeler arasında iletişim durumunda bunu yaparsak kodlar iyice karmaşık bir hal alacaktır, ayrıca esneklikten de feragat etmiş olacağız. Bu noktada sinyalleri kullanıyoruz. Örneğin 'player_hit' diye bir sinyal oluşturursak, bunu da can barı ve can yazısına bağladığımızı düşünelim. Oyuncu hasar aldığında 'player_emit(can)' dersek sadece hasar aldığında bu nodelere değeri yollayabiliriz. Eğer can barının olmamasına karar verirsek, tek yapmamız gereken o bağlantıyı kesmek olacaktır. Bunu oyun yaparken daha anlaşılır ve basit şekilde tekrar değineceğiz. Örnek diyagram:
- ![image.png](sunu-assets/image_1742590309408_0.png)
- # GDSript
- Godot; motorun kendisiyle entegre olan GDScript dilini kullanır anlaması basittir. Ayrıca resmi olarak C# dilini de destekler. Daha optimize ve ince işlemler için C ve C++ dillerini de destekler.
- # Sahne Dünyası ve 2D Sahne
- Godot'da 2D ve 3D oyun dünyası tamamen ayrıdır. Bundan dolayı pozitif Y yönü aşağısını gösterir. (0, 0) konumu sol en üst köşedir.
- ![image.png](sunu-assets/image_1742592345696_0.png)
- Positionda denklem girerek objeleri istediğimiz konuma koyabiliriz. Örneğin çözünürlük 1920x1080 ise 1080/2 diyip ekranın tam ortasına alabiliriz.
- ![image.png](sunu-assets/image_1742592435650_0.png)
- Godot sahnesinde nodelerin işlem sırası yukarıdan aşağıyadır. Ayrıca en önce işlenen görsel olarak da en altta çizilir.
- ![image.png](sunu-assets/image_1742592624046_0.png)
- Aşağıda 'output' yani çıktı kısmında her node hazır olduğunda ismini çıktı yazdırmıştır. Görüleceği yukarıdan aşağıya doğru bir sıra izler. Dikkat edilmesi gerekilen nokta ise Child2 hazır olmadan önce tüm child nodelerinin hazır olmasını bekler, hepsi hazır olduktan sonra o hazır olur ve işlem aşağıda doğru ilerlemeye devam eder.
- # Oyuna Giriş
- Burada yazılı olarak her detayı aktarmaktansa atölyede anlatım üzerinden odaklanacağım. Amacımız sadece yukarı aşağı hareket edebildiğimiz ve bize doğru yaklaşan meteorları vurduğumuz bir 2d top-down oyun olacak. Oyuncuyla başlayabiliriz.
- # Yararlı Kaynaklar
- Öncelikle Godot'un kendi dökümantasyon sitesinde Godot ile ilgili birçok içeriğe erişmekle birlikte onların da bıraktığı diğer kaynaklardan birçok bilgiye erişebilirsiniz.
- https://docs.godotengine.org/en/stable/about/introduction.html
- YouTube'da Godot University adında bir playlist bulunmakta güzel tutorial videolar içeren.
- https://www.youtube.com/watch?v=bP9zQyoYP28&list=PLrT2fbyJrAIctd7zNUsdPakIllX2lhrzo
- Sıfırdan GDScript ile kodlamayı öğrenme aracı. Türkçesi mevcut.
- https://gdquest.github.io/learn-gdscript/?ref=godot-docs

https://github.com/EakyRtk/ITU-Godot-Workshop-1
