//
//  DeepLinkManager.swift
//  ExamplePodMira
//
//  Created by Dmytro Vlasenko on 14.12.2022.
//

import Foundation

public class MiraDeepLinkManager {
   private init() {}
   public static func getDeepLinks(url: String, scheme: String) -> Dictionary<String,String>? {
       var component = url.components(separatedBy: "/")
       if ((component.first ?? "")) != scheme {
           return nil
       }
       component.removeFirst()
       component = component.filter {$0 != ""}
       if component.count % 2 > 0 { return nil }
       var dict: Dictionary<String,String> = [:]
       for i in stride(from: 0, to: component.count - 1, by: 2) {
           dict[component[i]] = component[i+1]
       }
       return dict
   }
}
