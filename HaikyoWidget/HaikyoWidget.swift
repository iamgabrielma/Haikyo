//
//  HaikyoWidget.swift
//  HaikyoWidget
//
//  Created by Gabriel Maldonado Almendra on 14/8/21.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    // WIP: The app crashes when tap to the net haiku because of the unwrapped optional. Fixed temporarily with nil-coalescent
    @State private var currentDailyHaiku = UserDefaults.standard.stringArray(forKey: "dailyHaiku") ?? ["a","b","c"]
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), haiku: currentDailyHaiku, configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), haiku: currentDailyHaiku, configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // WIP: Passing data from user defaults:
        let userDefaults = UserDefaults(suiteName: "group.haikyodata")
        let haiku = userDefaults?.value(forKey: "dailyHaiku" ?? "UserDefaults empty")
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, haiku: currentDailyHaiku, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let haiku: [String] // <-- this should come from UserDefaults
    let configuration: ConfigurationIntent
}

struct HaikyoWidgetEntryView : View {
    
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
        Text(entry.haiku[0])
        //Text(entry.haiku[0])
        //Text(entry.haiku[1])
        //Text(entry.haiku[2])
    }
}

@main
struct HaikyoWidget: Widget {
    let kind: String = "HaikyoWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            HaikyoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct HaikyoWidget_Previews: PreviewProvider {
    static var previews: some View {
        HaikyoWidgetEntryView(entry: SimpleEntry(date: Date(), haiku: ["a","b","c"], configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
