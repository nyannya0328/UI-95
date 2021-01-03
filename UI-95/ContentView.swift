//
//  ContentView.swift
//  UI-95
//
//  Created by にゃんにゃん丸 on 2021/01/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var show = false
    @State var txt = ""
    @State var data = ["p1","p2","p3","p4","p5","p6","p7","p8"]
    var body: some View{
        
        VStack(spacing:0){
            
            HStack{
                
                if !show {
                    
                    Text("Picture")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                
                
               
                
                Spacer(minLength: 0)
                
                HStack{
                    
                    
                    if show{
                        
                        Image(systemName: "magnifyingglass.circle.fill")
                        
                        TextField("Search", text: $txt)
                        
                        Button(action: {
                            self.txt = ""
                            withAnimation(.easeIn){show.toggle()}
                            
                        }, label: {
                            
                            
                            Image(systemName: "xmark")
                        })
                        
                        
                        
                    }
                    
                }
                .padding(show ? 10 : 0)
                .background(Color.white)
                .cornerRadius(10)
               
                
                
                
                Button(action: {
                    withAnimation(.easeIn){show.toggle()}
                }, label: {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .padding(10)
                        .background(Color.white)
                        .clipShape(Circle())
                })
                
                
            }
            .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
            .padding(.horizontal)
            .padding(.bottom,10)
            .background(Color.purple)
            
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack{
                    
                    if txt != ""{
                        
                if data.filter({$0.lowercased().contains(txt.lowercased())}).count == 0{
                            
                            Text("No results")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                                .padding(.top,5)
                            
                        }
                        
                else{
                    ForEach(data.filter({$0.lowercased().contains(txt.lowercased())}),id:\.self){i in
                        
                        CellView(image: i)
                        
                        
                    }
                    
                }
                        
                      
                        
                    }
                    else{
                        
                        ForEach(data,id:\.self){i in
                            
                            CellView(image: i)
                        
                    }
                    
                    
                   
                        
                       
                    }
                    
                }
                .padding(.horizontal,25)
                .padding(.top,10)
            })
            
        }
        .edgesIgnoringSafeArea(.top)
        
    }
    
    
}

struct CellView : View {
    
    var image : String
    var body: some View{
        
        ZStack(alignment:.bottomTrailing){
            
            
            Image(image)
                .resizable()
                .frame(height: 250)
                .cornerRadius(10)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "chevron.right")
            })
            .padding(10)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(radius: 5)
            
           
            
        }
        
    }
}
