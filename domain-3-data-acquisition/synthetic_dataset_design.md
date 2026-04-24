# Domain 3: Data Acquisition

## Dataset Design

This project uses a synthetic dataset representing clinical documentation activity.

The dataset is designed to support analysis of note status, note type distribution, department trends, and documentation timeliness.

## Dataset Fields

| Field | Description |
|---|---|
| note_id | Synthetic unique note identifier |
| department | Synthetic clinical department |
| provider_id | Synthetic provider identifier |
| note_type | Type of clinical documentation |
| note_status | Current documentation status |
| created_date | Date the note was created |
| signed_date | Date the note was signed, if applicable |
| days_to_sign | Number of days between creation and signature |
| is_overdue | Whether the note exceeds the assumed timeliness threshold |

## Data Boundaries

This dataset is fully synthetic and does not contain:

- Patient identifiers
- Provider names
- Encounter numbers
- Employer data
- Vendor-specific table names
- Internal system logic
- Protected health information

## Assumptions

For this project, a note is considered overdue if it remains unsigned or takes more than three days to sign.

This threshold is used only for demonstration purposes and does not represent a real organizational policy.
