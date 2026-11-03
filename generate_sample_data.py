
import csv
from datetime import date, timedelta
from pathlib import Path

# Synthetic chapter history for portfolio demonstration.
# These are not actual release dates or chapter updates.
STORIES = [
    {"title": "The Midnight Archive", "start": 40, "updates": [3, 6]},
    {"title": "Echoes of Tomorrow", "start": 25, "updates": [3]},
    {"title": "The Forgotten Kingdom", "start": 60, "updates": [3, 6]},
    {"title": "Jujutsu Kaisen", "start": 100, "updates": [3]},
    {"title": "Blue Lock", "start": 200, "updates": [3]},
    {"title": "One Piece", "start": 1100, "updates": [3, 6]},
    {"title": "Frankenstein", "start": 24, "updates": []},
    {"title": "Pride and Prejudice", "start": 61, "updates": []},
]

OUTPUT = Path(__file__).parent / "sample_chapter_history.csv"
START_DATE = date(2026, 10, 27)


def generate_data():
    rows = []

    for story in STORIES:
        for day in range(7):
            check_date = START_DATE + timedelta(days=day)
            chapter = story["start"] + sum(
                update_day <= day for update_day in story["updates"]
            )

            rows.append({
                "title": story["title"],
                "chapter_number": chapter,
                "check_date": check_date.isoformat(),
                "upload_date": check_date.isoformat(),
                "website_new": day in story["updates"],
                "chapter_url": "https://example.com/stories",
            })

    with OUTPUT.open("w", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=rows[0].keys())
        writer.writeheader()
        writer.writerows(rows)

    print(f"Generated {len(rows)} sample observations.")
    print(f"Saved to {OUTPUT}")


if __name__ == "__main__":
    generate_data()
