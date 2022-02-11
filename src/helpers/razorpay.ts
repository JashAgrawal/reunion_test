import {v4} from 'uuid'

// export function createOrder(params) {
//     return new Promise((resolve, reject) => {
//       const transactionId = v4();
  
//       const query = squel
//         .insert({ autoQuoteTableNames: true })
//         .into("orders")
//         .set("order_transaction_id", transactionId)
//         .set("order_plan", params.plan)
//         .set("order_payment_amount", params.amount)
//         .set("order_payment_currency", params.currency)
//         .set("order_created_by", params.createdBy)
//         .toString();
//         const q = 'select * from orders'
//       db.query(query, (error, rows, fields) => {
//         if (error) {
//           console.log(error);
//           dbFunc.connectionRelease;
//           reject(error);
//         } else {
//           resolve({
//             success: true,
//             message: "Order Created",
//             receipt: transactionId,
//           });
//         }
//       });
//     });
//   }