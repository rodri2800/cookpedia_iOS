//
//  CustomCardChef.swift
//  Cookpedia
//
//  Created by Rodrigo García Hernández on 12/04/23.
//

import SwiftUI



private struct BackgroundImageWithGradient: View {
    var url:String
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string:url), content: { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 210)
                    
            }, placeholder: {
                ProgressView()
            })
            LinearGradient(gradient: Gradient(
                stops: [
                    .init(color: Color.black.opacity(0), location: 0),
                    .init(color: Color.black.opacity(0.1), location: 0.25),
                    .init(color: Color.black.opacity(0.2), location: 0.5),
                    .init(color: Color.black, location: 1)
                ]
            ), startPoint: .top, endPoint: .bottom)
        }.clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

private struct ButtonAdd:View{
    
    var saved:Bool
    var action: () -> Void
    
    var body: some View{
        HStack{
            Spacer()
            Button(action: action, label: {
                Image(systemName: saved ? "bookmark.fill" : "bookmark" )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12)
                    .padding(12)
                    .foregroundColor(Color.white)
                    .background(Color("PrimaryColor"))
                    .clipShape(Circle())
            })
        }
    }
}


private struct NameChef:View{
    var name:String
    
    var body: some View{
        Text(name)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding(.bottom, -4.0)
            .frame(maxWidth: .infinity)
    }
}


struct CustomCardChef: View {
    
    
    var body: some View {
        ZStack{
            //Imagen de fondo
            BackgroundImageWithGradient(url: "https://static.cordonbleu.edu/Files/MediaFile/79299.jpg")
            VStack(){
                Spacer()
                NameChef(name: "George")
            }.frame(maxWidth: .infinity)
                .padding(12)
            
        }.frame(width: 150, height: 210)
        
    }
}


struct CustomCardChef_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardChef()
    }
}
