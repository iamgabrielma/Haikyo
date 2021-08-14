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

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), haiku: ["","",""], configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), haiku: ["","",""], configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let userDefaults = UserDefaults(suiteName: "group.haikyodata")
        let dailyHaiku = userDefaults?.value(forKey: "dailyHaiku") ?? ["","",""]
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(    date: entryDate,
                                        haiku: dailyHaiku as! [String],
                                        configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let haiku: [String] // <-- This will come from UserDefaults
    let configuration: ConfigurationIntent
}

struct HaikyoWidgetEntryView : View {
    
    var entry: Provider.Entry
    
    var body: some View {
        // Each line of the Haiku:
        Text(entry.haiku[0]).font(.caption)
        Text("·")
        Text(entry.haiku[1]).font(.caption)
        Text("·")
        Text(entry.haiku[2]).font(.caption)
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
