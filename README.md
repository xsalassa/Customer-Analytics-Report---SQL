# Customer Analytics: SQL case study

A set of six SQL exercises exploring order activity, revenue, subscriber/customer growth, product-category preferences, and repeat transactions. The original repository stores SQL scripts with example query outputs.

> **Status:** Existing educational analysis, currently being improved for clarity and reproducibility. This README describes the current files; it does not claim the queries are production-ready.

## Questions answered

| Step | Existing file | Topic |
| --- | --- | --- |
| 1 | `1. Understanding Table.sql` | Inspect available customer and order tables. |
| 2 | `2. Calculating the percentage of overall sales.sql` | Compare quantity and revenue across two quarterly order tables. |
| 3 | `3. Is the number of xyz.com subscribers growing.sql` | Explore customer/subscriber growth. |
| 4 | `4. How many of these customers have made transactions.sql` | Identify customers with order activity. |
| 5 | `5. What product categories did customers order the most in Quarter-2.sql` | Examine product-category demand. |
| 6 | `6. How many customers are still actively transacting after the first transaction.sql` | Explore repeat customers across periods. |

## Referenced tables

The inspected scripts refer to:

- `orders_1`: first-period order rows;
- `orders_2`: second-period order rows;
- `customer`: customer reference records.

Observed fields include `orderNumber`, `orderDate`, `status`, `customerID`, `productCode`, `quantity`, and `priceeach`. The example queries calculate shipped-order revenue from `quantity * priceeach`.

The original dataset files and import instructions are not present in the repository root. Reproduction requires a compatible dataset obtained with permission.

## Important review findings

1. **Hardcoded repeat-customer denominator.** The current retention query divides by `25`, based on the provided sample output. It should dynamically calculate the distinct customer population from `orders_1`.
2. **Terminology.** The script calls its result a quarterly measure, but the logic compares customers present in two periods. Define whether the desired metric is retained customers, repeat purchase rate, or another measure.
3. **Set operation.** A revenue query uses `UNION` between first- and second-period order rows. Review whether `UNION ALL` is required to preserve repeated rows and correct revenue totals.
4. **Runnable SQL.** Several `.sql` files include copied output tables. Move these into Markdown examples or ensure the files remain executable as SQL-only scripts.
5. **Data and provenance.** Document dataset source, license, SQL dialect, schema, and expected outputs before calling this a reproducible example.

## Proposed validation queries

The following is **illustrative proposed code** to replace the fixed retention denominator, not a claim that it has been tested against the original data.

```sql
WITH first_period AS (
    SELECT DISTINCT customerID
    FROM orders_1
    WHERE customerID IS NOT NULL
),
second_period AS (
    SELECT DISTINCT customerID
    FROM orders_2
    WHERE customerID IS NOT NULL
)
SELECT
    COUNT(*) AS first_period_customers,
    COUNT(s.customerID) AS returning_customers,
    ROUND(100.0 * COUNT(s.customerID) / NULLIF(COUNT(*), 0), 2) AS returning_pct
FROM first_period f
LEFT JOIN second_period s
    ON f.customerID = s.customerID;
```

The actual interpretation depends on the time-window and cancellation/status rules defined for the dataset.

## Proposed next steps

- [ ] Move query results to `docs/results.md`; leave executable SQL in the `.sql` files.
- [ ] Add the original dataset's approved provenance and schema documentation.
- [ ] Verify and correct period-to-period revenue logic.
- [ ] Add SQL validation for distinct customers, returned customers, and edge cases.
- [ ] Add a simple entity-relationship diagram.
- [ ] Create synthetic fixtures so others can run tests without restricted data.

## Attribution

Please retain attribution to the original data provider or course once source and reuse conditions have been confirmed.
