//
//  ContentView.swift
//  DessertFoodapp
//
//  Created by Fazil P on 09/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = 1
    @State var selectedTabBottom = 1
    
    
    var body: some View {
        
        ZStack {
            VStack {
                Title()
                
//                MARK: toptabs
                
                Toptabs(selectedTab: self.$selectedTab)
                
//                MARK: Scroll food items
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        DesertItems(img: "dessert1", deserttitle: "Creamy chocolate", chef: "Fazil", chefImg: "Profile")
                        DesertItems(img: "dessert2", deserttitle: "Dark Molten Chocolate Cakes", chef: "Cédric Grolet", chefImg: "Profile2")
                        DesertItems(img: "dessert3", deserttitle: "Denver's Whiskey-Injected Doughnuts", chef: "Christophe Michalak", chefImg: "Profile3")
                        DesertItems(img: "dessert4", deserttitle: "cheesecake mousse", chef: "Antonio Bachour", chefImg: "Profile1")
                        DesertItems(img: "dessert5", deserttitle: "Classic French Desserts", chef: "Dinara Kasko", chefImg: "Profile4")
                        DesertItems(img: "dessert6", deserttitle: "Angel Strawberry Dessert", chef: "Antonio Bachour", chefImg: "Profile1")
                        DesertItems(img: "dessert7", deserttitle: "Milk Barfi", chef: "Cédric Grolet", chefImg: "Profile2")
                        DesertItems(img: "dessert8", deserttitle: "Gulab Jamun", chef: "Cédric Grolet", chefImg: "Profile2")
                        
                    }.padding([.leading, .trailing], 30)
                    .padding(.bottom, 20)
                }
                
                Spacer()
                
//                MARK: Bottom TabBar
                
                BottomTabView(selectedTabBottom: self.$selectedTabBottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Title: View {
    var body: some View {
        HStack {
            Text("Favorite")
                .foregroundColor(.blue)
                .font(.system(size: 28, weight: .semibold, design: .default))
            Spacer()
        }.padding([.leading,.trailing], 30)
        .padding(.bottom, 40)
    }
}

struct Toptabs: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            VStack {
                HStack(spacing: 0) {
                    VStack {
                        Button(action: {
                            self.selectedTab = 1
                        }) {
                            
                            Text("All")
                                .font(.headline)
                                .foregroundColor(selectedTab == 1 ? Color.blue : Color.secondary)
                        }
                        
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 5)
                            .opacity(selectedTab == 1 ? 100 : 0)
                    }.frame(height: 20)
                    
                    VStack {
                        Button(action: {
                            self.selectedTab = 2
                        }) {
                            
                            Text("Cookbooks")
                                .font(.headline)
                                .foregroundColor(selectedTab == 2 ? Color.blue : Color.secondary)
                        }
                        
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 5)
                            .opacity(selectedTab == 2 ? 100 : 0)
                    }.frame(height: 20)
                    
                    VStack {
                        Button(action: {
                            self.selectedTab = 3
                        }) {
                            
                            Text("Recently")
                                .font(.headline)
                                .foregroundColor(selectedTab == 3 ? Color.blue : Color.secondary)
                        }
                        
                        Rectangle()
                            .fill(Color.blue)
                            .frame(height: 5)
                            .opacity(selectedTab == 3 ? 100 : 0)
                    }.frame(height: 20)
                }
            }.padding(.bottom, 10)
            .padding(.top, 25)
            .border(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), width: 1)
        }.padding(.bottom, 5)
    }
}


struct DesertItems: View {
    
    var img: String = ""
    var deserttitle: String = ""
    var chef: String = ""
    var chefImg: String = ""
    
    var body: some View {
        VStack {
            Image(self.img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:200)
                .cornerRadius(20)
                .clipped()
            
            HStack{
                Text("25 min")
                    .font(.headline)
                Text("198 cal")
                    .font(.headline)
                HStack{
                    Text("Rating")
                        .font(.headline)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                }
                Spacer()
            }.frame(height: 30)
            
            HStack {
                
                Image(self.chefImg)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(self.deserttitle)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    Text(self.chef)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(Color.secondary)
                }
                Spacer()
            }
        }.padding(.bottom, 30)
    }
}

struct BottomTabView: View {
    @Binding var selectedTabBottom: Int
    
    var body: some View {
        HStack {
            VStack {
                
                Button(action: {}) {
                    
                    VStack{
                        Image(systemName: "heart.fill")
                            .resizable().frame(width: 30, height: 30)
                            .foregroundColor(self.selectedTabBottom == 1 ? Color.blue : Color.secondary)
                        Text("Favorite")
                            .font(.system(size: 9, weight: .medium, design: .default))
                            .foregroundColor(self.selectedTabBottom == 1 ? Color.blue : Color.secondary)
                    }
                }
            }
            
            Spacer()
            
            VStack {
                
                Button(action: {self.selectedTabBottom = 2}) {
                    
                    VStack{
                        Image(systemName: "magnifyingglass")
                            .resizable().frame(width: 30, height: 30)
                            .foregroundColor(self.selectedTabBottom == 2 ? Color.blue : Color.secondary)
                        Text("Search")
                            .font(.system(size: 9, weight: .medium, design: .default))
                            .foregroundColor(self.selectedTabBottom == 2 ? Color.blue : Color.secondary)
                    }
                }
                
            }
            Spacer()
            
            VStack {
                
                Button(action: {self.selectedTabBottom = 3}) {
                    
                    VStack{
                        Image(systemName: "cart")
                            .resizable().frame(width: 30, height: 30)
                            .foregroundColor(self.selectedTabBottom == 3 ? Color.blue : Color.secondary)
                        Text("Shopping")
                            .font(.system(size: 9, weight: .medium, design: .default))
                            .foregroundColor(self.selectedTabBottom == 3 ? Color.blue : Color.secondary)
                    }
                }
            }
            Spacer()
            
            VStack {
                
                Button(action: {self.selectedTabBottom = 4}) {
                    
                    VStack{
                        Image(systemName: "person")
                            .resizable().frame(width: 30, height: 30)
                            .foregroundColor(self.selectedTabBottom == 4 ? Color.blue : Color.secondary)
                        Text("Profile")
                            .font(.system(size: 9, weight: .medium, design: .default))
                            .foregroundColor(self.selectedTabBottom == 4 ? Color.blue : Color.secondary)
                    }
                }
            }
        }.padding([.leading, .trailing], 30)
    }
}
